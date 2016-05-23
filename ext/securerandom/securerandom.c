#include "ruby/ruby.h"

void arc4random_buf(void *buf, size_t n);

/*
 * @overload gen_random
 *   @param num [Integer] the number of random bytes to generate
 * @return [String] source format string
 */
static VALUE
securerandom_gen_random(VALUE module, VALUE num)
{
    long len = NUM2LONG(num);
    VALUE bytes = rb_str_new(NULL, len);
    arc4random_buf(RSTRING_PTR(bytes), len);
    RB_GC_GUARD(bytes);
    return bytes;
}

/*
 * Document-class: SecureRandom
 *
 * SecureRandom is .
 *
 * @example
 *    SecureRandom.gen_random() #=> "\xA9[\xDE\xDC\xB9\xF2\xD6Y"
 */
void
Init_securerandom(void)
{
    VALUE rb_mSecureRandom = rb_define_module("SecureRandom");
    rb_define_singleton_method(rb_mSecureRandom, "gen_random", securerandom_gen_random, 1);
}
