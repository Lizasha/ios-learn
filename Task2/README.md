#  Task 2

## Объясните почему блок "Work 2" не выполняется?
```swift
 let serialQueue = DispatchQueue(label: "com.foo.bar")
 serialQueue.async {
     print("Work 1")
         serialQueue.sync {
             print("Work 2")
     }
 } 
```
1. Запускается `main thread`. 
2. Создаем очередь `serialQueue`.
3. Запускается блок кода, неблокирующий `main thread`
4. Выполняется `print("Work 1")`,   если программа еще не завершилась
5. Программа завершает свою работу до запуска синхронного блока `serialQueue.sync`
6. Если программа не завершится, например с помощью `sleep(1)`, будет deadlock `serialQueue`, потому что очередь заблокирует сама себя
