"""Generate and work with PEP 425 Compatibility Tags."""

import distutils.util
import platform
import sys
import os
import sysconfig
import warnings

from .macosx_libfile import extract_macosx_min_system_version


try:
    from importlib.machinery import all_suffixes as get_all_suffixes
except ImportError:
    from imp import get_suffixes

    def get_all_suffixes():
        return [suffix[0] for suffix in get_suffixes()]


def get_config_var(var):
    try:
        return sysconfig.get_config_var(var)
    except IOError as e:  # pip Issue #1074
        warnings.warn("{0}".format(e), RuntimeWarning)
        return None


def get_abbr_impl():
    """Return abbreviated implementation name."""
    impl = platform.python_implementation()
    if impl == 'PyPy':
        return 'pp'
    elif impl == 'Jython':
        return 'jy'
    elif impl == 'IronPython':
        return 'ip'
    elif impl == 'CPython':
        return 'cp'

    raise LookupError('Unknown Python implementation: ' + impl)


def get_impl_ver():
    """Return implementation version."""
    impl_ver = get_config_var("py_version_nodot")
    if not impl_ver:
        impl_ver = ''.join(map(str, get_impl_version_info()))
    return impl_ver


def get_impl_version_info():
    """Return sys.version_info-like tuple for use in decrementing the minor
    version."""
    return sys.version_info[0], sys.version_info[1]


def get_flag(var, fallback, expected=True, warn=True):
    """Use a fallback method for determining SOABI flags if the needed config
    var is unset or unavailable."""
    val = get_config_var(var)
    if val is None:
        if warn:
            warnings.warn("Config variable '{0}' is unset, Python ABI tag may "
                          "be incorrect".format(var), RuntimeWarning, 2)
        return fallback()
    return val == expected


def get_abi_tag():
    """Return the ABI tag based on SOABI (if available) or emulate SOABI
    (CPython 2, PyPy)."""
    soabi = get_config_var('SOABI')
    impl = get_abbr_impl()
    if not soabi and impl in ('cp', 'pp') and hasattr(sys, 'maxunicode'):
        d = ''
        m = ''
        u = ''
        if get_flag('Py_DEBUG',
                    lambda: hasattr(sys, 'gettotalrefcount'),
                    warn=(impl == 'cp')):
            d = 'd'
        if get_flag('WITH_PYMALLOC',
                    lambda: impl == 'cp',
                    warn=(impl == 'cp' and
                          sys.version_info < (3, 8))) \
                and sys.version_info < (3, 8):
            m = 'm'
        if get_flag('Py_UNICODE_SIZE',
                    lambda: sys.maxunicode == 0x10ffff,
                    expected=4,
                    warn=(impl == 'cp' and
                          sys.version_info < (3, 3))) \
                and sys.version_info < (3, 3):
            u = 'u'
        abi = '%s%s%s%s%s' % (impl, get_impl_ver(), d, m, u)
    elif soabi and soabi.startswith('cpython-'):
        abi = 'cp' + soabi.split('-')[1]
    elif soabi:
        abi = soabi.replace('.', '_').replace('-', '_')
    else:
        abi = None
    return abi


def calculate_macosx_platform_tag(archive_root, platform_tag):
    """
    Calculate proper macosx platform tag basing on files which are included to wheel

    Example platform tag `macosx-10.14-x86_64`
    """
    prefix, base_version, suffix = platform_tag.split('-')
    base_version = tuple([int(x) for x in base_version.split(".")])
    if len(base_version) >= 2:
        base_version = base_version[0:2]

    assert len(base_version) == 2
    if "MACOSX_DEPLOYMENT_TARGET" in os.environ:
        deploy_target = tuple([int(x) for x in os.environ[
            "MACOSX_DEPLOYMENT_TARGET"].split(".")])
        if len(deploy_target) >= 2:
            deploy_target = deploy_target[0:2]
        if deploy_target < base_version:
            sys.stderr.write(
                 "[WARNING] MACOSX_DEPLOYMENT_TARGET is set to a lower value ({}) than the "
                 "version on which the Python interpreter was compiled ({}), and will be "
                 "ignored.\n".format('.'.join(str(x) for x in deploy_target),
                                     '.'.join(str(x) for x in base_version))
                )
        else:
            base_version = deploy_target

    assert len(base_version) == 2
    start_version = base_version
    versions_dict = {}
    for (dirpath, dirnames, filenames) in os.walk(archive_root):
        for filename in filenames:
            if filename.endswith('.dylib') or filename.endswith('.so'):
                lib_path = os.path.join(dirpath, filename)
                min_ver = extract_macosx_min_system_version(lib_path)
                if min_ver is not None:
                    versions_dict[lib_path] = min_ver[0:2]

    if len(versions_dict) > 0:
        base_version = max(base_version, max(versions_dict.values()))

    # macosx platform tag do not support minor bugfix release
    fin_base_version = "_".join([str(x) for x in base_version])
    if start_version < base_version:
        problematic_files = [k for k, v in versions_dict.items() if v > start_version]
        problematic_files = "\n".join(problematic_files)
        if len(problematic_files) == 1:
            files_form = "this file"
        else:
            files_form = "these files"
        error_message = \
            "[WARNING] This wheel needs a higher macOS version than {}  " \
            "To silence this warning, set MACOSX_DEPLOYMENT_TARGET to at least " +\
            fin_base_version + " or recreate " + files_form + " with lower " \
            "MACOSX_DEPLOYMENT_TARGET:  \n" + problematic_files

        if "MACOSX_DEPLOYMENT_TARGET" in os.environ:
            error_message = error_message.format("is set in MACOSX_DEPLOYMENT_TARGET variable.")
        else:
            error_message = error_message.format(
                "the version your Python interpreter is compiled against.")

        sys.stderr.write(error_message)

    platform_tag = prefix + "_" + fin_base_version + "_" + suffix
    return platform_tag


def get_platform(archive_root):
    """Return our platform name 'win32', 'linux_x86_64'"""
    # XXX remove distutils dependency
    result = distutils.util.get_platform()
    if result.startswith("macosx") and archive_root is not None:
        result = calculate_macosx_platform_tag(archive_root, result)
    result = result.replace('.', '_').replace('-', '_')
    if result == "linux_x86_64" and sys.maxsize == 2147483647:
        # pip pull request #3497
        result = "linux_i686"

    return result


def get_supported(archive_root, versions=None, supplied_platform=None):
    """Return a list of supported tags for each version specified in
    `versions`.

    :param versions: a list of string versions, of the form ["33", "32"],
        or None. The first version will be assumed to support our ABI.
    """
    supported = []

    # Versions must be given with respect to the preference
    if versions is None:
        versions = []
        version_info = get_impl_version_info()
        major = version_info[:-1]
        # Support all previous minor Python versions.
        for minor in range(version_info[-1], -1, -1):
            versions.append(''.join(map(str, major + (minor,))))

    impl = get_abbr_impl()

    abis = []

    abi = get_abi_tag()
    if abi:
        abis[0:0] = [abi]

    abi3s = set()
    for suffix in get_all_suffixes():
        if suffix.startswith('.abi'):
            abi3s.add(suffix.split('.', 2)[1])

    abis.extend(sorted(list(abi3s)))

    abis.append('none')

    platforms = []
    if supplied_platform:
        platforms.append(supplied_platform)
    platforms.append(get_platform(archive_root))

    # Current version, current API (built specifically for our Python):
    for abi in abis:
        for arch in platforms:
            supported.append(('%s%s' % (impl, versions[0]), abi, arch))

    # abi3 modules compatible with older version of Python
    for version in versions[1:]:
        # abi3 was introduced in Python 3.2
        if version in ('31', '30'):
            break
        for abi in abi3s:   # empty set if not Python 3
            for arch in platforms:
                supported.append(("%s%s" % (impl, version), abi, arch))

    # No abi / arch, but requires our implementation:
    for i, version in enumerate(versions):
        supported.append(('%s%s' % (impl, version), 'none', 'any'))
        if i == 0:
            # Tagged specifically as being cross-version compatible
            # (with just the major version specified)
            supported.append(('%s%s' % (impl, versions[0][0]), 'none', 'any'))

    # Major Python version + platform; e.g. binaries not using the Python API
    for arch in platforms:
        supported.append(('py%s' % (versions[0][0]), 'none', arch))

    # No abi / arch, generic Python
    for i, version in enumerate(versions):
        supported.append(('py%s' % (version,), 'none', 'any'))
        if i == 0:
            supported.append(('py%s' % (version[0]), 'none', 'any'))

    return supported
