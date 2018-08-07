var gulp = require('gulp');
var rename = require('gulp-rename');
var concat = require('gulp-concat');
var del = require('del');

//压缩js
var uglify = require('gulp-uglify');
var jshint = require('gulp-jshint');

//处理css文件
var cleanCSS = require('gulp-clean-css');
var autoprefixer = require('gulp-autoprefixer');
var minifycss = require('gulp-minify-css');

gulp.task("default", function () {
    gulp.run("build");
})

gulp.task("build", function () {
    gulp.run("clean");
    gulp.run("default");
    gulp.run("baseJs");
    gulp.run("baseCss");
    gulp.run("font");
})

gulp.task("dev", function () {
    gulp.run("build");
    var jswatcher = gulp.watch('js/*.js', ['baseJs']);
    jswatcher.on('change', function (e) {

    });
    var csswatcher = gulp.watch('js/*.css', ['baseCss']);
    csswatcher.on('change', function (e) {

    });
})

gulp.task("clean", function () {
    del(["dist/*"]);
})
//baseJs
var baseJsList = [
    "./lib/jquery/jquery.js",
    "./lib/vue/vue.js",
    "./lib/vue-router/vue-router.js",
    "./lib/element-ui/index.js",
    "./lib/iview/iview.js",
];
//baseCss
var baseCssList = [
    "./lib/element-ui/index.css",
    "./lib/iview/iview.css",
];
gulp.task("baseJs", function () {
    return gulp.src(baseJsList)
        .pipe(concat("base.js"))
        .pipe(uglify())
        .pipe(rename({suffix: '.min'}))
        .pipe(gulp.dest("dist"))
})
//baseCss
gulp.task("baseCss", function () {
    return gulp.src(baseCssList)
        .pipe(cleanCSS())
        .pipe(concat("base.css"))
        .pipe(autoprefixer('last 2 version', 'safari 5', 'ie 8', 'ie 9', 'opera 12.1', 'ios 6', 'android 4'))
        .pipe(minifycss())
        .pipe(rename({suffix: '.min'}))
        .pipe(gulp.dest("dist"))
})
//字体
var baseFontList = [
    "./lib/element-ui/fonts/*",
    "./lib/iview/fonts/*",
    "./lib/vue/fonts/*"
];
gulp.task('font', function () {
    gulp.src(baseFontList)
        .pipe(gulp.dest('dist/fonts'));
});