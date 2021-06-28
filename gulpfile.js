const { src, dest, watch } = require('gulp');
const uglify = require('gulp-uglify');
const gulpsass = require('gulp-sass');

sass.compiler = require('node-sass');

function sass() {
  return src('lib/scss/main.scss')
    .pipe(gulpsass())
    .pipe(dest('assets/css/'));
}

function javascript() {
  return src(['node_modules/bootstrap/dist/js/bootstrap.bundle.js', 'lib/js/*.js', 'node_modules/scrollreveal/dist/scrollreveal.js'])
    .pipe(uglify())
    .pipe(dest('assets/js'));
}


exports.default = function () {
  // On ecoute les events liés au js, et on déclenche la fonction javascript si besoin
  watch('lib/js/*.js', javascript);
  // On ecoute les events liés au scss, et on déclenche la fonction sass si besoin
  watch(['lib/scss/**/*.scss', 'lib/scss/*.scss'], sass);

};