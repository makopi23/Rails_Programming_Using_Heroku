
function doDelete(id){
  if(confirm("レコードを削除しますか？")){
    location.href = "/sample/delete?id=" + id
  }
}
