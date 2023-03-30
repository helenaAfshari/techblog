

class ApiConstant{

  static const hostDlUrl ="https://techblog.sasansafari.com";
  static const baseUrl ="https://techblog.sasansafari.com/Techblog/api/";
  static const getHomeItems =baseUrl + "home/?command=index";
  static const getArticleList =baseUrl + "article/get.php?command=new&user_id=";
  static const getArticleInfo =baseUrl + "/Techblog/api/article/get.php?command=info&id=1&user_id=1";
  static const PublishedByMe = baseUrl + "article/get.php?command=published_by_me&user_id=1";
  static const postRegister = baseUrl + "register/action.php"; 
  static const articlePost = baseUrl + "article/post.php";
  static const podcastFile = baseUrl + "podcast/get.php?command=get_files&podcats_id=";
  static const PublishedByMePodcast = baseUrl + "podcast/get.php?command=published_by_me&user_id=";
  static const postTitle = baseUrl + "podcast/post.php";
  
}

class ApiArticleKeyConstant{

  static const title ="title";
  static const content ="content";
  static const catId ="cat_id";
  static const tagList ="tag_list";
  static const userId ="user_id";
  static const image ="image";
  static const command ="command";

}