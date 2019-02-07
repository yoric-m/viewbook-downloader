# viewbook-downloader
Automate the process of downloading all Viewbook albums

This script will help downloading all the albums you have on your online "viewbook" account (so you don't need to download them manually one by one).

10 steps to get it working:
==========================

0. Clone this repository and go inside
1. Log-in on the https://app.viewbook.com website with your username and password
2. Display the "developper tool"
3. Select the "Network" tab and click on any albums
4. Click on the cachekiller name that just appeared to view the headers output
5. Scroll down until you see the second (longest) cookie string, starting with "cookie: __ cfduid=...")
6. Copy that entire string, without copying "cookie" at the start
7. paste that string into a file "cookie.txt" (you need to create the file in the current directory)
8. Run "./create_download_list.sh" from the console (it is supposed to create the file "download_list")
9. Run "./start_download.sh" from the console
