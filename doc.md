#设置开发环境  
a: windows 11  
b. visual studio 2022  
c. 创建开发目录  
d. run "c:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"  

e. 编辑代码并保存。  
f. 编译代码，生成exe文件（生成可执行文件）：ml64 xxx.asm /link /subsystem:console /entry:main  
g. 运行exe文件  
h. 检查返回结果。  
i. 上传代码到github:  
```
echo "# learning_doc" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/greateDouDou/learning_doc.git
git push -u origin main
```