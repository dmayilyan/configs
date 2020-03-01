files = document.getElementsByClassName('hhr-table-new__row-cell cell--fileName')


for (var i = 0; i < files.length; i++) {
    try {
        window.open(files[i].innerChild);
    } catch (error) {
        console.info(error)
    }

}