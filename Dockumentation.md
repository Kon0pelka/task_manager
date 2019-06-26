# ДОКУМЕНТАЦИЯ Tack-manager #
## API для главного сайта ##
### Вход в систему ###
`GET api/auth/sing_in`  

Параметры запроса:
* email - почтовый адресс
* password - пароль

Пример запроса:
```
{
	"email": "tkach32max5@gmail.com",
	"password": "qqqqqqq"
}
```
    
Возможные ответы:
* status 200:
```
{
    "data": {
        "id": 1,
        "email": "example@g.com",
        "name": "Max",
        "provider": "email",
        "uid": "example@g.com",
        "allow_password_change": false,
        "nickname": null,
        "friendly_id": "Max#a5ef9388"
    }
}
```
* status 401 (неверно указан или логин или пароль):
```
{
    "success": false,
    "errors": [
        "Invalid login credentials. Please try again."
    ]
}
```
* status 401 (не подтвержден email):
```
{
    "success": false,
    "errors": [
        "A confirmation email was sent to your account at '32max-rus@list.ru'. You must follow the instructions in the email before your account can be activated"
    ]
}
```
### Регистрация в системе с помощью email ###
`POST /api/auth`

Параметры запроса:
* email - почтовый адресс
* name - имя
* password - пароль
* confirm_success_url - url подтвеждения почты
* image - аватар
* nickname - прозвище

Пример запроса:
```
{
	"email": "32max-rus@list.ru",
	"password": "qqqqqqq",
	"name": "Max",
	"confirm_success_url": "localhost:3000"
}
```

Возможные ответы:
* status 200:
```
{
  "status": "success",
  "data": {
    "id": 2,
    "provider": "email",
    "uid": "32max-rus@list.ru",
    "allow_password_change": false,
    "name": "Max",
    "nickname": null,
    "email": "32max-rus@list.ru",
    "created_at": "2019-06-08T05:50:51.524Z",
    "updated_at": "2019-06-08T05:50:51.524Z",
    "friendly_id": "Max#e7479249"
  }
}
```
* status 422 (если неверно указан один из параметров)
```
{ message: пояснение_по_ошибке }
```

### Список задач ###
`GET api/v1/tasks`  

Параметры ответа:
* tasks_executor - задачи для выполнения:
    * id - идентификатор напитка
    * volume - название объема напитка
    * syrup_id - идентификатор сиропа
    * count - кол-во напитков
* tasks_director - посталиные задачи:
    * id - идентификатор блюда


Возможные ответы:
* status 200:
```
{
    "tasks_executor": [],
    "tasks_director": []
}
```

### Постановка задачи ### 
`Post api/v1/tasks`  

Параметры запроса:
* title - название задачи
* description - описание задачи
* date_task - крайний срок задачи
* to_remind - нужно ли напоминать пользователю о задаче

Пример запроса:
```
{
	"title": "Што-то сделай",
	"description": "Ну сделай што нить!",
	"date_task": "29-06-2019",
  "to_remind": true
}
```

Возможные ответы:
* status 200:
```
{
  "id": 2,
  "created_at": "2019-06-08T06:21:08.857Z",
  "updated_at": "2019-06-08T06:21:08.857Z",
  "title": "Што-то сделай",
  "description": "Ну сделай што нить!",
  "status": "set",
  "to_remind": false,
  "date_task": "2019-06-29T00:00:00.000Z",
  "director_id": 1,
  "executor_id": 1,
  "group_id": null
}
```

### Просмотреть определенную задачу ### 
`GET api/v1/tasks/#{id}`  

Параметры ответа:
* title - название задачи
* description - описание задачи
* date_task - крайний срок задачи
* to_remind - нужно ли напоминать пользователю о задаче
* status - статус задачи
* director_id - постановщик задачи
* executor_id - исполнитель задачи

Возможные ответы:
* status 200:
```
{
  "id": 2,
  "created_at": "2019-06-08T06:21:08.857Z",
  "updated_at": "2019-06-08T06:21:08.857Z",
  "title": "Што-то сделай",
  "description": "Ну сделай што нить!",
  "status": "set",
  "to_remind": false,
  "date_task": "2019-06-29T00:00:00.000Z",
  "director_id": 1,
  "executor_id": 1,
  "group_id": null
}
```
* status 404 (если такой задачи не существует или она не пренадлежит данному пользователю):
```
{}
```
### Изменение определенной задачи ### 
`PUT api/v1/tasks/#{id}`  

Параметры ответа:
* title - название задачи
* description - описание задачи
* date_task - крайний срок задачи
* to_remind - нужно ли напоминать пользователю о задаче
* status - статус задачи

Пример запроса:
```
{
	"status": [set performed done]
}
```
Возможные ответы:
* status 200:
```
{
  "id": 2,
  "created_at": "2019-06-08T06:21:08.857Z",
  "updated_at": "2019-06-08T06:35:29.055Z",
  "title": "Што-то сделай",
  "description": "Ну сделай што нить!",
  "status": "done",
  "to_remind": false,
  "date_task": "2019-06-29T00:00:00.000Z",
  "director_id": 1,
  "executor_id": 1,
  "group_id": null
}
```
* status 404 (если такой задачи не существует или она не пренадлежит данному пользователю):
```
{}
```
### Изменение определенной задачи ### 
`DELETE   /api/v1/tasks/#{id}`  
 Возможные ответы:
* status 200:
```
{}
```
