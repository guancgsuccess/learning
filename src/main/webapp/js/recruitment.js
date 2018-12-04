function recruitment() {
    var keyword = document.getElementById("recruitment_condition").value;
    var url = "/recruitment/selectRecruitmentByKeyword/" + keyword;
    window.location.href = url;
}