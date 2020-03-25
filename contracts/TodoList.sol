pragma solidity ^0.5.0;

// The following is the Smart contract:
contract TodoList {
    // keep track of the n of tasks
    // state (uint) var: written to the blockchain
    // unsigned integer: integer that can't be negative
    // public: the value is readable
    uint public taskCount = 0;

    // own data types (structs)
    struct Task {
        uint id;
        string content;
        bool completed;
    }
    // mapping =~ hash/associative array. K/V storaged.
    // key: uint(ID); value: the task
    // =~ DataBase
    // todoList.tasks ::: when it called,
    // we get returned all the tasks in the list.
    mapping(uint => Task) public tasks;

    // event we can subscribe or unsubscribe
    event TaskCreated (
        uint id,
        string content,
        bool completed
    );

    event TaskCompleted (
        uint id,
        bool completed
    );

    // default task for the todo-list:
    constructor() public {
        createTask('Read Sherlock Holmes for school.');
    }

    // function: create a new task.
    // put the struct into the mapping.
    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }

    // find an specific task and change the 'completed' state to true:
    function toggleCompleted(uint _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
    }
}