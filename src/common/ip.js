function ip4ToInt(ip) {
  return ip.split('.').reduce((int, oct) => (int << 8) + parseInt(oct, 10), 0) >>> 0;
}

function isIp4InCidr(ip, cidr) {
  const [range, bits = 32] = cidr.split('/');
  const mask = ~(2 ** (32 - bits) - 1);
  return (ip4ToInt(ip) & mask) === (ip4ToInt(range) & mask);
}

function isIp4InCidrs(ip, cidrs) {
  for (let i = 0; i < cidrs.length; i++) {
    const isIn = isIp4InCidr(ip, cidrs[i]);
    if (isIn) {
      return true;
    }
  }
  return false;
};

function areIp4sInCidrs(ips, cidrs) {
  for (let i = 0; i < ips.length; i++) {
    const isIn = isIp4InCidrs(ips[i], cidrs);
    if(isIn){
      return true;
    }
  }
  return false;
}

exports.areIp4sInCidrs = areIp4sInCidrs;
