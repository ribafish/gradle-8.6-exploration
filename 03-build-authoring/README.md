# Build authoring improvements

### Lazy name-based filtering of tasks

Run a build (for example using the `build` task) in both projects and watch out for `Unrelated task created` in the console output. With Gradle 8.5, you don't have the option to use `tasks.named {}` (added in 8.6), which is always lazy, so you need to use `tasks.matching{}`. Even though `.matching{}` will still be lazy when you are only looking at the `name` of tasks due to internal magic, it's still recommended to use `.named{}`, as that will always be lazy and it only supports looking at names, preventing you to accidentally configure all tasks when looking at other values (unless needed). If you need to check for name and type, you can chain them like `.withType<T>().named {}`.

### Allow Providers to be used with dependency capabilities

Check out the differences when using capabilities in the `app/build.gradle.kts` file. You can try to add a provider in Gradle 8.5 and see what happens.