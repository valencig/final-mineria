#engineering train data
walmart_data <- add.variables(walmart_data)

walmart_data <- change_description(walmart_data)

walmart_data <- generate_groups(walmart_data)

#engineering test data
walmart_test <- add.variables.test(walmart_test)

walmart_test <- change_description_test(walmart_test)

walmart_test <- generate_groups_test(walmart_test)
