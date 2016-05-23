require "mkmf"

$objs = ["securerandom.#{$OBJEXT}", "arc4random.#{$OBJEXT}", "getentropy.#{$OBJEXT}"]
$objs.pop if CONFIG['target_os'].include?('openbsd')
create_makefile("securerandom/securerandom")
