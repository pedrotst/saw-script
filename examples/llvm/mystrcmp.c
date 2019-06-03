#include <string.h>

typedef struct {
  char *ptr;
  long i;
  long j;
} string_struct;

int my_cmp(string_struct ls, string_struct rs){
  char foo[8] = { 0 };
  char bar[8] = { 0 };
  char *l = ls.ptr;
  char *r = rs.ptr;

  /* l = foo; */
  /* r = bar; */

  if(!l && !r)
    return 0;

  if(!l)
    return -1;
  if(!r)
    return 1;

  return strcmp(l, r);
}

int cmp(char* l, char* r){
  if(!l && !r)
    return 0;

  if(!l)
    return -1;
  if(!r)
    return 1;

  return strcmp(l, r);
}

int64_t my_strlen(char* l){
  if(!l)
    return -1;

  return strlen(l);
}
