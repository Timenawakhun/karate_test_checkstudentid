Feature: checkStudentId
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'http://localhost:6969/students/v1/check/'

  Scenario: check studentId com-sci success
    Given path 'studentid'
    And request {studentId: '59090500409'}
    When method post
    Then status 200
    And match $ == {faculty: "วิทยาศาสตร์",department: "คณิตศาสตร์",major: "วิทยาการคอมพิวเตอร์ประยุกต์"}
    And match $ == {faculty: "#notnull",department: "#notnull",major: "#notnull"}
    And match $ == {faculty: "#string",department: "#string",major: "#string"}
    And match $.faculty != "#null"
    And match $.department != "#null"
    And match $.major != "#null"
    And match $.faculty != "#number"
    And match $.department != "#number"
    And match $.major != "#number"

  Scenario: check studentId stat-sci success
    Given path 'studentid'
    And request {studentId: '59090500209'}
    When method post
    Then status 200
    And match $ == {faculty: "วิทยาศาสตร์",department: "คณิตศาสตร์",major: "สถิติประยุกต์"}
    And match $ == {faculty: "#notnull",department: "#notnull",major: "#notnull"}
    And match $ == {faculty: "#string",department: "#string",major: "#string"}
    And match $.faculty != "#null"
    And match $.department != "#null"
    And match $.major != "#null"
    And match $.faculty != "#number"
    And match $.department != "#number"
    And match $.major != "#number"

  Scenario: check studentId math-sci success
    Given path 'studentid'
    And request {studentId: '59090500009'}
    When method post
    Then status 200
    And match $ == {faculty: "วิทยาศาสตร์",department: "คณิตศาสตร์",major: "คณิตศาสตร์"}
    And match $ == {faculty: "#notnull",department: "#notnull",major: "#notnull"}
    And match $ == {faculty: "#string",department: "#string",major: "#string"}
    And match $.faculty != "#null"
    And match $.department != "#null"
    And match $.major != "#null"
    And match $.faculty != "#number"
    And match $.department != "#number"
    And match $.major != "#number"

  Scenario: check studentId result should be message
    Given path 'studentid'
    And request {studentId: ''}
    When method post
    Then status 200
    And match $ == {message: "กรุณากรอกข้อมูล"}
    And match $.message == "#notnull"
    And match $.message == "#string"
    And match $.message != "#number"

  Scenario: check studentId result check incomplete
    Given path 'studentid'
    And request {studentId: '5909050022'}
    When method post
    Then status 200
    And match $ == {message: "กรุณากรอกให้ครบ 11 ตัว"}
    And match $.message == "#notnull"
    And match $.message == "#string"
    And match $.message != "#number"

  Scenario: check studentId result check overnumber
    Given path 'studentid'
    And request {studentId: '5909050022888'}
    When method post
    Then status 200
    And match $ == {message: "คุณใส่ตัวเลขมากกว่า 11 ตัว"}
    And match $.message == "#notnull"
    And match $.message == "#string"
    And match $.message != "#number"

  Scenario: check studentId result check except text
    Given path 'studentid'
    And request {studentId: 'gnvjsozdnweiofjvm'}
    When method post
    Then status 200
    And match $ == {message: "กรุณาใส่เฉพาะตัวเลข"}
    And match $.message == "#notnull"
    And match $.message == "#string"
    And match $.message != "#number"

  Scenario: check studentId result check not found
    Given path 'studentid'
    And request {studentId: '59090500809'}
    When method post
    Then status 200
    And match $ == {message: "not found"}
    And match $.message == "#notnull"
    And match $.message == "#string"
    And match $.message != "#number"
    