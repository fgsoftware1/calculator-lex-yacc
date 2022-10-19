AC_PREREQ([2.69])
AC_INIT([calculator yacc/lex], [1.0], [https://github.com/fgsoftware1/fgOS/issues])
AC_CONFIG_SRCDIR([y.tab.h])
AC_PROG_CC
AC_PROG_YACC
AC_PROG_LEX
AC_PROG_INSTALL
AC_PROG_MAKE_SET
AC_CONFIG_SRCDIR([src/])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
#types
AC_TYPE_INT16_T
AC_TYPE_INT32_T
AC_TYPE_INT8_T
AC_TYPE_SIZE_T
AC_TYPE_UINT16_T
AC_TYPE_UINT32_T
AC_TYPE_UINT8_T
AC_CHECK_TYPES([ptrdiff_t])
#libs
AC_CHECK_LIB([fl], [main])
AC_CHECK_LIB([m], [main])
#headers
AC_CHECK_HEADERS([inttypes.h libintl.h limits.h malloc.h stddef.h stdint.h stdlib.h string.h unistd.h])
#funcs
AC_FUNC_ALLOCA
AC_FUNC_MALLOC
AC_FUNC_REALLOC
AC_CHECK_FUNCS([memset pow sqrt])
#src
AC_CONFIG_FILES([
  Makefile
  src/Makefile
])
AC_OUTPUT