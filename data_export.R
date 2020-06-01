library(dplyr)
library(magrittr)
df <-mtcars %>%
select(mpg, disp, gear) %>%
group_by(gear) %>%
summarize(mean_mpg = mean(mpg), mean_disp = mean(disp))
print(df)

write.csv(df, "C:/Users/HP/Desktop/rcode/cars.csv")
write.csv2(df, "C:/Users/HP/Desktop/rcode/cars2.csv")


#open_folder <-function(dir){
#  if (.Platform['OS.type'] == "windows"){
#    shell.exec(dir)  
#  } else {
#    system(paste(Sys.getenv("R_BROWSER"), dir))
#  }
#}
# Call the function to open the folder
#open_folder(directory)

library(xlsx)
write.xlsx(df, "C:/Users/HP/Desktop/rcode/cars.xlsx")

library(haven)
write_sav(df, "C:/Users/HP/Desktop/rcode/cars.sav")
write_sas(df, "C:/Users/HP/Desktop/rcode/cars.sas7bdat")
write_dta(df, "C:/Users/HP/Desktop/rcode/cars.dta")
save(df, file ='C:/Users/HP/Desktop/rcode/cars.RData')

library(googledrive)
drive_upload("C:/Users/HP/Desktop/rcode/cars.csv", name = "carsr")


#reading...

csv1.df=read.csv(file="C:/Users/HP/Desktop/rcode/cars.csv")
csv2.dfread.csv2(file="C:/Users/HP/Desktop/rcode/cars2.csv")
xltab.df=read.table(file="C:/Users/HP/Desktop/rcode/cars.xlsx",sep="\t")
xl.df=read.xlsx(file="C:/Users/HP/Desktop/rcode/cars.xlsx",sheetIndex = 1)
del.df=read.delim(file="C:/Users/HP/Desktop/rcode/cars.csv",sep=",")


x <-drive_get("carsr")
as_id(x)

