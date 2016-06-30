# Framework

## Custom Search Engine

### Configuration

To use a custom search engine, it is first needed to change the
`config.properties` as follows.

```shell
searchType=CUSTOM
```

### Implementation

The first step is to add an implementation to the `SearchAccessLayer` interface.

```java
class CustomSearchEngine implements SearchAccessLayer {

    @Override
    public void uploadIndex(SecuredIndex index, boolean flush) {
        // Upload the encrypted index to the search engine
    }

    @Override
    public EncryptedSearchResponse search(Query encQuery) {
        // Search for the encrypted keywords in the index
    }

    @Override
    public void deleteIndex(String encId, boolean flush) {
        // Delete an entry from the index
    }

    @Override
    public void updatePath(String oldId, String newId, boolean flush) {
        // Update an entry in the index
    }

    @Override
    public void updateKeywords(SecuredIndex securedIndex, boolean flush) {
        // Update the keywords of an index
    }

    @Override
    public void close() {
        // Close the connection with the search backend
    }

}
```
### Provide the custom implementation to the Inpher SDK

Once the custom implementation of the `SearchAccessLayer` is completed, you need
to provide by calling `AccessLayersProvider.addSearchProvider()`. It is
important to call it before creating the InpherClient object.
```java
// SearchAccessLayer customSearch;
AccessLayersProvider.addSearchProvider(customSearch);

// ...

InpherClient client = InpherClient.getClient()
```

## Custom Storage Backend

### Configuration

To use a custom storage backend, it is first needed to change the
`config.properties` as follows.

```shell
storageType=CUSTOM
```

### Implementation

The first step is to add an implementation to the `FSAccessLayer` interface.

```java
class CustomStorage implements FSAccessLayer {

    @Override
    boolean mkdir(BackendPath dir) throws BackendPathNotFoundException, 
           BackendPathExistsException {
        // Create a new directory at dir (example: /user/finance/march)

        // If the directory (/user/finance/march) already exists throw a BackendPathExistsException
        // If the parent (/user/finance) is not found throw a BackendPathNotFoundException

        // return true if the directory was created; false otherwise
    }

    @Override
    public InputStream open(BackendPath file) throws
            BackendPathNotFoundException, BackendPathIsDirectoryException {
        // Open file for read.
        // This must lock the file for read and release the lock on stream close.

        // If the file does not exists throw a BackendPathNotFoundException.
        // If file is a directory throw a BackendPathIsDirectoryException.

        // Return an InputStream that releases the read lock on close.
    }

    @Override
    public OutputStream create(BackendPath file, boolean override) throws
            BackendPathExistsException, BackendPathIsDirectoryException {
        // Create a file for write.
        // This must acquire a write lock and release the lock on stream close.

        // If the file already exists and override is flase throw a BackendPathExists Exception
        // If file is a directory throw a BackendPathIsDirectoryException

        // Return an OutputStream that releases the write lock on close.
    }

    @Override
    public boolean delete(BackendPath path, boolean recursive) throws
            BackendPathNotFoundException {
        // Delete a file or a directory

        // If the path is not found throw BackendPathNotFoundException

        // return true if delete was successful; false otherwise
    }

    @Override
    public boolean exists(BackendPath path) {
        // Tests whether a given path exists on the backend
    }

    @Override
    public boolean rename(BackendPath src, BackendPath dest) throws
            BackendPathNotFoundException, BackendPathExistsException {
        // Rename the given src path to dest path. Rename can only be performed
        // within the same directory.

        // If src does no exist throw BackendPathNotFoundException
        // If dest already exists throw BackendPathExistsException

        // return true if rename was successful
    }

    @Override
    public byte[] getMetadata(BackendPath path, String metadataKey) throws
            MetadataNotFoundException, BackendPathNotFoundException {
        // Get the path metadataKey value from the given path.
        // Each directory/file can have a map of key-value pair the key being
        // the metadata key and the value being the bytes content of the
        // metadata for the key.

        // If the path does not have metadata for the given key throw
        // MetadataNotFounException.
        // If the path does not exist throw BackendPathNotFoundException

        // return the value for the given key in bytes
    }

    @Override
    public void setMetadata(BackendPath path, String metadataKey, byte[] value)
            throws BackendPathNotFoundException {
        // Set the metadataKey value for the given path.

        // If path does not exist throw BackendPathNotFoundException.
    }

    @Override
    public void removeMetadata(BackendPath path, String metadataKey) throws
            MetadataNotFoundException, BackendPathNotFoundException {
        // Remove the metadataKey key-value pair for the given path.

        // If the path does not exist throw BackendPathNotFoundException.
        // If the Metadata Key-value pair does not exist for the given path
        // throw MetadataNotFoundException.
    }

    @Override
    public boolean hasMetadata(BackendPath path, String metadataKey) throws
            BackendPathNotFoundException {
        // Checks whether path has a metadata key-value pair for the given
        // metadata key.

        // If the path does not exist throw BackendPathNotFoundException

        // return true if the key-value pair exists.
    }

    @Override
    public boolean isDirectory(BackendPath path) {
        // Tests whether the given path is a directory.
    }

    @Override
    public boolean isFile(BackendPath path) {
        // Test whether the given path is a file.
    }

    @Override
    public BackendIterator<BackendElementStatus> list(BackendPath path) throws
            BackendPathNotFoundException {
        // Listing a directory. The returned result is a remote iterator that
        // queries the backend whenever the caller asks for the next element.
        // Hidden files or directories do not appear in list.

        // If the path does not exist throw BackendPathNotFoundException.

        // Return an iterator on the list of path children if path is a
        // directory. Return an iterator consisting of path only if path is
        // a file.
    }

    @Override
    BackendElementStatus getBackendElementStatus(BackendPath path) throws
            BackendPathNotFoundException {
        // Get the backend element status of a given path.

        // If the path does not exist throw BackendPathNotFoundException.
    }

}
```
### Provide the custom implementation to the Inpher SDK

Once the custom implementation of the `StorageAcccessLayer` is completed, you need
to provide by calling `AccessLayersProvider.addFSProvider()`. It is
important to call it before creating the InpherClient object.
```java
// FSAccessLayer customStorage;
AccessLayersProvider.addSearchProvider(customStorage);

// ...

InpherClient client = InpherClient.getClient()
```
