# reset example

file.remove("time_diff.txt")

list.files("finished_data", 
           recursive = TRUE, 
           full.names = TRUE) %>% 
    file.remove()




unlink("./finished_data")
