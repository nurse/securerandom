require "bundler"
Bundler::GemHelper.install_tasks
require "rspec/core/rake_task"
require 'yard'

RSpec::Core::RakeTask.new(:spec)

task :default => [:compile, :spec]
require "rake/extensiontask"

task :build => :compile
task :spec => :compile

desc 'Generate YARD document'
YARD::Rake::YardocTask.new(:doc) do |t|
  t.files   = ['ext/securerandom/securerandom.c']
  t.options = []
  t.options << '--debug' << '--verbose' if $trace
end

spec = eval File.read("securerandom.gemspec")
Rake::ExtensionTask.new("securerandom", spec) do |ext|
  ext.ext_dir = 'ext/securerandom'
  ext.cross_compile = true
  ext.lib_dir = File.join(*['lib', 'securerandom', ENV['FAT_DIR']].compact)
  # cross_platform names are of MRI's platform name
  ext.cross_platform = ['x86-mingw32', 'x64-mingw32']
end

namespace :build do
  desc 'Build gems for Windows per rake-compiler-dock'
  task :windows do
    require 'rake_compiler_dock'
    RakeCompilerDock.sh 'bundle && rake cross native gem RUBY_CC_VERSION=2.0.0:2.1.6:2.2.2:2.3.0'
  end
end

task :update_files, %w[libressl_path] do |_, args|
  require 'fileutils'
  path = args[:libressl_path]
  %w[
src/lib/libc/crypt/arc4random.c ext/securerandom/
src/lib/libc/crypt/arc4random.h ext/securerandom/arc4random_openbsd.h
src/lib/libc/crypt/chacha_private.h ext/securerandom/
src/lib/libcrypto/crypto/arc4random_aix.h ext/securerandom/
src/lib/libcrypto/crypto/arc4random_freebsd.h ext/securerandom/
src/lib/libcrypto/crypto/arc4random_hpux.h ext/securerandom/
src/lib/libcrypto/crypto/arc4random_linux.h ext/securerandom/
src/lib/libcrypto/crypto/arc4random_netbsd.h ext/securerandom/
src/lib/libcrypto/crypto/arc4random_osx.h ext/securerandom/
src/lib/libcrypto/crypto/arc4random_solaris.h ext/securerandom/
src/lib/libcrypto/crypto/arc4random_win.h ext/securerandom/
src/lib/libcrypto/crypto/getentropy_aix.c ext/securerandom/
src/lib/libcrypto/crypto/getentropy_freebsd.c ext/securerandom/
src/lib/libcrypto/crypto/getentropy_hpux.c ext/securerandom/
src/lib/libcrypto/crypto/getentropy_linux.c ext/securerandom/
src/lib/libcrypto/crypto/getentropy_netbsd.c ext/securerandom/
src/lib/libcrypto/crypto/getentropy_osx.c ext/securerandom/
src/lib/libcrypto/crypto/getentropy_solaris.c ext/securerandom/
src/lib/libcrypto/crypto/getentropy_win.c ext/securerandom/
  ].each_slice(2) do |src, dest|
    FileUtils.cp(File.join(path, src), dest)
  end
end
