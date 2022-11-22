//SPDX-License-Identifier: MIT 
pragma solidity 0.8.7;

contract StudentData 
{
    struct Student 
    {
        uint rollNo;
        string name;
        uint marks;
    }
    Student[] public students;
    function AddNewStudent(uint rno, string memory name, uint mks) public 
    {
        students.push(Student(rno, name, mks));
    }
    function DisplayByRollNo(uint rno) view public returns (uint, string memory, uint) 
    {
        for(uint i=0; i<students.length; i++) 
        {
            if(students[i].rollNo == rno) 
            {
                return(students[i].rollNo, students[i].name, students[i].marks);
            }
        }
    }
    function UpdateMarks(uint rno, uint mks) public 
    {
        for(uint i=0; i<students.length; i++) 
        {
            if(students[i].rollNo == rno) 
            {
                students[i].marks = mks;
            }
        }
    }
    function DeleteStudentData(uint rno) public 
    {
        for(uint i=0; i<students.length; i++) 
        {
            if(students[i].rollNo == rno) 
            {
                delete students[i];
            }
        }
    }
    function TotalStudents() view public returns(uint) 
    {
        return (students.length);
    }
    // fallback function
    fallback() external{  

    }
}