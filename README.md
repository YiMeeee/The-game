这里计划存放2个大文件分别为Godot自己的版本GDScript，和C#版本，首先会将GD版本的给做出来，后续优化我想使用C#来重新塑造。

AI测试的文件是连接API的，目前是GD语言，详细使用可以看打开的内容。

正式使用版本为GameV6版本，目前我还在升级维护。

目前在做新版本，API用硅基流动的Deepseek

新添加了肉鸽游戏模拟


# 必须要下载插件Dialogue

# AI交互界面的设计：

 在场景中添加这些节点：
Control

├── VBoxContainer

│   ├── ScrollContainer # 对话历史容器

│   │   └── Label/RichTextLabel # 显示对话历史

│   ├── HBoxContainer # 输入区容器

│   │   ├── LineEdit # 用户输入框

│   │   └── Button # 发送按钮
