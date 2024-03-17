const task = document.getElementById("task");
const list = document.getElementById("list");

function addElement(){
    let newTask = document.createElement('div');
    let taskText = document.createElement('p');
    let delBtn = document.createElement('button');
    taskText.innerHTML = task.value;
    delBtn.innerHTML = "ELIMINA";
    newTask.classList.add("task");
    taskText.classList.add("taskText");
    delBtn.classList.add("delBtn");
    list.appendChild(newTask);
    newTask.appendChild(taskText); 
    newTask.appendChild(delBtn); 
    delBtn.addEventListener('click', function(){
        this.parentElement.remove()
    })
}