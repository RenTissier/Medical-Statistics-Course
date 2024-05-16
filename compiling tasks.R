chapter.folders <- list.dirs(path = './tasks',recursive=F)
parameters <- c(TRUE,FALSE)
names <-c('','.nocode')
mainfolder <- getwd()
savingfolder <- paste0(mainfolder,'/_book/')

for (chapter in chapter.folders){
  tasks <- list.files(chapter)
  for (task in tasks){
    nametask <- substr(task,1,nchar(task)-4)
    for (version in 1:2){
      param = parameters[version]
      rmarkdown::render(input = paste(chapter,task,sep='/'), output_format ="html_document" , output_file = paste0(savingfolder,nametask,names[version],'.html'))
    }
  }
}

