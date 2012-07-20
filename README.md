## Chef Intro repository

In this repository we solve some very basic tasks, it helps you practice Chef. Check the commit history to see the steps separately:

1. _Create a basic recipe that installs apache2._ We create new apache cookbook, that only has a package resource in the default recipe, we create a new webserver role that we add to the `run_list` of the node.
2. _Use attributes._ We specify default attributes in the cookbook, create a simple template that uses these attributes and override attributes in the role.
3. _Create a recipe that create a virtualhost named example.com._ We create a directory and the virtualhost configuration from a template.
4. _Modify the previous recipe to go through all the items in a data bag and creates vhosts based on the data there._
