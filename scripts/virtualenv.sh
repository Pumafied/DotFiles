#for d in ./*/ ; do (cd "$d" && virtualenv env && source env/bin/activate && pip3 install -r requirements.txt); done


for d in ./*/ ; do (cd "$d" && if [ -f "requirements.txt" ]; then virtualenv env && source env/bin/activate && pip3 install -r requirements.txt; fi); done


