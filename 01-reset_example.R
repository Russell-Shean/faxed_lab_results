# reset example
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
# remove intermediate data
list.files(intermediate_data_folder, 
           recursive = TRUE, 
           full.names = TRUE) %>% 
    file.remove()

# remove final data
list.files(final_data_folder, 
           recursive = TRUE, 
           full.names = TRUE) %>% 
  file.remove()



