import shutil, os

path = input("Enter Chapters Path:")

mrg_dir= input("Enter Destination Path:")

dir_list = os.listdir(path)

dir_list.sort()

subdir=""

files=[]

count=1

file_path=""

destination=""

print ("starting")

for dir in dir_list:
    subdir = path + "/" + str(dir)
    print("processing " + subdir)
    files = os.listdir(subdir)
    files.sort()
    for file in files:
        file_path = subdir + "/" +  str(file)
        print("Doing file " + file_path)
        destination = mrg_dir + "/" + str(count) + ".jpeg"
        print("Destination of " + file_path + "is " + destination)
        shutil.copyfile(file_path , destination)
        count += 1
print("Done")        

