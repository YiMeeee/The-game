extends Control
@onready var create_diglog: HTTPRequest = $CreateDiglog
@onready var ask_question: HTTPRequest = $AskQuestion
var con_id: String #创建的对话id

func _ready() -> void:
	create()#这里必须要有，是调用方法，这个函数类似main，是主函数

#发起对话请求
func create():
	var url :=''#这里存放我们需要输入的链接
	var body :={
		"app_id":""#运用到了API调用的地方
	}#这里需要放置我们需要的api接口地址
	var headers :=[
		'Content-Type: application/json',
		'X-Appbuilder-Authorization:  '#:号后面放密钥，没有就去创建一个
	]
	#我们需要利用API来实现对对话的请求
	create_diglog.request(url,headers,HTTPClient.METHOD_POST, JSON.new().stringify(body))
	#我们最终需要调动request（）；来向服务器发送一个创建聊天机器人的对话请求
	#接下来把json转换为字符串
func _on_create_diglog_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	#连接信号接受服务器响应
	var json := JSON.new()
	json.parse(body.get_string_from_utf8())#解析字符串,utf8应该可以处理中文吧，大概....
	#print(json.data)#利用json对象解析，解析结果存放在json.data 】中
	con_id = json.data['conversation_id']
	ask("你好！")

#conversation_id每次发起对话都要创建一个
func ask(question: String):#再定义一个函数，发起问题
	var url :=''#这里应该放入请求接口的url
	var body :={
		"app_id":"",
		"query": question,
		"stream":false,
		"conversation_id": con_id #每次发起对话的conversation_id作为参数
			
	}#这里应该重新去找相关网页，请求体
	var headers :=[
		'Content-Type: application/json',
		'X-Appbuilder-Authorization:  '#复制上面的
	]
	#我们需要利用API来实现对对话的请求
	ask_question.request(url,headers,HTTPClient.METHOD_POST, JSON.new().stringify(body))
	#我们最终需要调动request（）；来向服务器发送一个创建聊天机器人的对话请求
	#接下来把json转换为字符串
	


func _on_ask_question_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
		#连接信号接受服务器响应
	var json := JSON.new()
	json.parse(body.get_string_from_utf8())#解析字符串,utf8应该可以处理中文吧，大概....
	#print(json.data)#利用json对象解析，解析结果存放在json.data 】中
	print("answer:$s" % [json.data['answer']])
