import '../app/flashes';
$(function () {
  $('[data-toggle="popover"]').popover({
      trigger: 'focus'

  })
})

document.querySelectorAll(".parentselector").forEach(i => {
  i.addEventListener('click', (e)=>{
    e.preventDefault();
    console.log(e.target.dataset);
    document.getElementById('photo_parent_id').value = e.target.dataset.photoId
    $("#exampleModal").modal('hide')

  })
})
