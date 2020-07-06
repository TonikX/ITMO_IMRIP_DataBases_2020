/**
 * Event listener on row editing
 * Fill inputs with correct data
 * @param {Object} event 
 */
function onEditRow(event) {
    const cells = event.target.parentNode.parentNode.cells;

    if (typeof cells !== 'undefined') {
        const id = cells[0].textContent;
        const name = cells[1].textContent;
        const surname = cells[2].textContent;
        const date = cells[3].textContent;
        const sex = cells[4].textContent;
        const classId = cells[5].textContent;

        if (id && name && surname && date && sex && classId) {
            document.getElementById('studentId').value = id;
            document.getElementById('studentName').value = name;
            document.getElementById('studentSurname').value = surname;
            document.getElementById('studentBirth').value = date;
            document.getElementById('studentSex').value = sex;
            document.getElementById('studentClassId').value = classId;
        }
    }
    
}