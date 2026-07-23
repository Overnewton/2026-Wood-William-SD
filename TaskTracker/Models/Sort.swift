//
//  Sort.swift
//  TaskTracker
//
//  Created by William Wood on 18/6/2026.
//


//selection sort due date - only used when there is less than 10 values as if there are too many, it could be slower, returning the sorted list
func selectionSortDueDate(array: [Task]) -> [Task] {

    if array.count > 1 {

        var arr = array

        for x in 0 ..< arr.count - 1 {

            var lowest = x

            for y in x + 1 ..< arr.count {

                if arr[y].dueDate < arr[lowest].dueDate {

                lowest = y
            }
        }
        if x != lowest {
        arr.swapAt(x, lowest)
        }
    }
        return arr
    } else {
    return array
    }
}

//quick sort due date - used when there are 10 or more values as when there are large quantities of data to sort, this can be faster and more efficient than selection sorts, returning the sorted list
func quickSortDueDate(array: [Task]) -> [Task] {
    var less: [Task] = []
    var equal: [Task] = []
    var greater: [Task] = []

    if array.count > 1 {

        let pivot = array[array.count - 1]

        for x in array {

            if x.dueDate < pivot.dueDate {

                less.append(x)

            }

            if x.dueDate == pivot.dueDate {

                equal.append(x)

            }

            if x.dueDate > pivot.dueDate {

                greater.append(x)
            }
    }
    return (quickSortDueDate(array: less) + equal + quickSortDueDate(array: greater))
    } else {
        return array
    }}

//selection sort priority - only used when there is less than 10 values as if there are too many, it could be slower, returning the sorted list
func selectionSortPriority(array: [Task]) -> [Task] {

    if array.count > 1 {

        var arr = array

        for x in 0 ..< arr.count - 1 {

            var lowest = x

            for y in x + 1 ..< arr.count {

                if arr[y].priority < arr[lowest].priority {

                lowest = y
            }
        }
        if x != lowest {
        arr.swapAt(x, lowest)
        }
    }
        return arr
    } else {
    return array
    }
}

//quick sort priority - used when there are 10 or more values as when there are large quantities of data to sort, this can be faster and more efficient than selection sorts, returning the sorted list
func quickSortPriority(array: [Task]) -> [Task] {
    var less: [Task] = []
    var equal: [Task] = []
    var greater: [Task] = []

    if array.count > 1 {

        let pivot = array[array.count - 1]

        for x in array {

            if x.priority < pivot.priority {

                less.append(x)

            }

            if x.priority == pivot.priority {

                equal.append(x)

            }

            if x.priority > pivot.priority {

                greater.append(x)
            }
    }
    return (quickSortPriority(array: less) + equal + quickSortPriority(array: greater))
    } else {
        return array
    }}


//selection sort class - only used when there is less than 10 values as if there are too many, it could be slower, returning the sorted list
func selectionSortClass(array: [Task]) -> [Task] {

    if array.count > 1 {

        var arr = array

        for x in 0 ..< arr.count - 1 {

            var lowest = x

            for y in x + 1 ..< arr.count {

                if arr[y].taskClass < arr[lowest].taskClass {

                lowest = y
            }
        }
        if x != lowest {
        arr.swapAt(x, lowest)
        }
    }
        return arr
    } else {
    return array
    }
}

//quick sort class - used when there are 10 or more values as when there are large quantities of data to sort, this can be faster and more efficient than selection sorts, returning the sorted list
func quickSortClass(array: [Task]) -> [Task] {
    var less: [Task] = []
    var equal: [Task] = []
    var greater: [Task] = []

    if array.count > 1 {

        let pivot = array[array.count - 1]

        for x in array {

            if x.taskClass < pivot.taskClass {

                less.append(x)

            }

            if x.taskClass == pivot.taskClass {

                equal.append(x)

            }

            if x.taskClass > pivot.taskClass {

                greater.append(x)
            }
    }
    return (quickSortClass(array: less) + equal + quickSortClass(array: greater))
    } else {
        return array
    }}


