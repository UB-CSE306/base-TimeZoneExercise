#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include "CUnit.h"
#include "Automated.h"
#include "time.h"

void test01(void) {}

int main() {
   CU_pSuite Suite = NULL;
   if (CUE_SUCCESS != CU_initialize_registry()) { return CU_get_error(); }
   Suite = CU_add_suite("Suite_of_tests_with_valid_inputs", NULL, NULL);
   if (NULL == Suite) {
      CU_cleanup_registry();
      return CU_get_error();
   }
   if ( ( NULL == CU_add_test(Suite, "message", test01) ) ) {
      CU_cleanup_registry();
      return CU_get_error();
   }
   CU_set_output_filename("test");
   CU_automated_run_tests();
   CU_cleanup_registry();
   return CU_get_error();
}
