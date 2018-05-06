#CMakeTestMacros.cmake

macro(report_failed_test)
  message("EXPECTED")
  if(TEST_EXPECTED)
    message("${TEST_EXPECTED}")
  else(TEST_EXPECTED)
    message("test1K.data *OK")
  endif(TEST_EXPECTED)
  message("GOT")
  message("Variables")
  message("RHASH")
  message("${RHASH}")
  message(TEST_RESULT)
  message("${TEST_RESULT}")
  message("TEST_ERROR_RESULT")
  message("${TEST_ERROR_RESULT}")
  message("TEST_ERR_VAR")
  message("${TEST_ERR_VAR}")
  message(SEND_ERROR "FAILED!!!")
endmacro(report_failed_test)

macro(checkrun)
  if((TEST_ERR_VAR GREATER 0) OR TEST_ERROR_RESULT)
    report_failed_test()
  endif((TEST_ERR_VAR GREATER 0) OR TEST_ERROR_RESULT)
endmacro(checkrun)

macro(checkrun_exitcod_2)
  if(TEST_ERR_VAR GREATER 2)
    report_failed_test()
  endif(TEST_ERR_VAR GREATER 2)
  if(TEST_ERR_VAR LESS 2)
    report_failed_test()
  endif(TEST_ERR_VAR LESS 2)
endmacro(checkrun_exitcod_2)

macro(check_POS_OK)
  if(_POS_OK)
  else(_POS_OK)
    report_failed_test()
  endif(_POS_OK)
endmacro(check_POS_OK)

macro(check_test_res_equality)
  if("${TEST_RESULT}" STREQUAL "${TEST_EXPECTED}")
  else("${TEST_RESULT}" STREQUAL "${TEST_EXPECTED}")
    report_failed_test()
  endif("${TEST_RESULT}" STREQUAL "${TEST_EXPECTED}")
endmacro(check_test_res_equality)

macro(checktestfail)
string(REGEX MATCH "test_.*OK" _POS_OK "${TEST_RESULT}")
  check_POS_OK()
endmacro(checktestfail)

macro(checktestfail_ERR)
checkrun()
string(REGEX MATCH "test_.*ERR" _POS_OK "${TEST_RESULT}")
check_POS_OK()
endmacro(checktestfail_ERR)

