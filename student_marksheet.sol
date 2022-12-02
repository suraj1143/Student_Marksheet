//SPDX-License-Identifier: MIT
// Owner of Smart contract will be class teacher.
// Only Class teacher will have authority to add student details(eg. First name,Last name etc) and student scores.
// Use reference data type to store student details and score in various subjects
// Use mappings to map scores and details with student id
// Minimum two functions should be there:
// a.for adding student details
// b. For adding scores in different subjects
// Use modifier to ensure only teacher can add details.
pragma solidity ^0.8.9;
contract scoreCard {
    address public classTeacher;
    constructor(){
        classTeacher=msg.sender;
    }
    modifier onlyClassTeacher {
        require(msg.sender == classTeacher);
        _;
    }
    struct studentDetails{
        uint mobile;
        string name; 
    }
    struct studentMark{
        uint Solidity;
        uint hyperledger;
        uint react;
    }
    event studentAdded(uint id,string name);
    // 

    mapping (uint =>studentDetails) public studentDetailMapping;
    mapping (uint =>studentMark) public studentMarkMapping;

    function addStudent(uint studentId, string memory name, uint mobile) public onlyClassTeacher {
      studentDetailMapping[studentId].mobile = mobile;
      studentDetailMapping[studentId].name = name;
      emit studentAdded(studentId,name);
    }

    function addMark(uint studentId, uint Solidity, uint hyperledger, uint react) public onlyClassTeacher {
      studentMarkMapping[studentId].Solidity = Solidity;
      studentMarkMapping[studentId].hyperledger = hyperledger;
      studentMarkMapping[studentId].react = react;
    }
}