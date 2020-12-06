# Create all the virtualenv's should be run after the code downloader

# if we find a requireents file make a virtualenv
#for d in ./*/ ; do (cd "$d" && virtualenv env && source env/bin/activate && pip3 install -r requirements.txt); done


for d in ./*/ ; do (cd "$d" && if [ -f "requirements.txt" ]; then virtualenv env && source env/bin/activate && pip3 install -r requirements.txt; fi); done

