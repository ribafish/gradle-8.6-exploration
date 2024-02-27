# Error reporting improvements

https://docs.gradle.org/8.6/release-notes.html

### Clearer suggested actions in case of dependency locking errors

To test uncomment the `Break the lock` line in `setting-gradle.lockfile` in both projects, run the build as usual and see the difference in the error output.

### Better error reporting of circular references in providers

To test (try to) run the `circular` task and see the difference in the error output.