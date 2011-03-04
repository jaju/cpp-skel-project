/*
 * Copyright 2011 Ravindra Jaju (jaju [AT] msync org)
 */

#pragma once
#ifdef HAVE_CONFIG_H
# include "config.h"
#endif

#ifdef __cplusplus
#  define BEGIN_C_DECLS extern "C" {
#  define END_C_DECLS   }
#  define BEGIN_NAMESPACE(x) namespace x {
#  define END_NAMESPACE(x) }
#  define USING_NAMESPACE(x) using namespace x
#  define safe_delete(x) if (x) { delete x; x = 0; }
#else /* !__cplusplus */
#  define BEGIN_C_DECLS
#  define END_C_DECLS
#  define BEGIN_NAMESPACE(x)
#  define END_NAMESPACE(x)
#  define USING_NAMESPACE(x)
#endif /* __cplusplus */

#ifdef __GNUC__
# define likely(x) __builtin_expect(!!(x), 1)
# define unlikely(x)  __builtin_expect(!!(x), 0)
#else
# define likely(x) (x)
# define unlikely(x) (x)
#endif
