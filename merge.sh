#!/bin/bash
branch_list=$(git branch | grep "" | sed "s/\* //" | sed -e "s/^ //g" -e "s/ $//g")
for branch in ${branch_list}
do
   if [ ${branch} != "master" ]; then
       git checkout ${branch} && git merge master --no-edit && git checkout master
       echo Master branch merge to ${branch}
   fi
done
