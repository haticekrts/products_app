# products_app

A new Flutter project.
TR
Bu projeyi Erciyes Üniversitesi Bilgisayar Mühendisliği Mobile Application Development course 2024 Spring season Term Project için geliştirdim.Projenin çalışma prensibi şu şekilde: ProductService sınıf ProductInterface sınıfndan kalıtım almakta. ProductInterface sınıfnda
yer alan getAll() fonksiyonunu kalıtım alan ProductService sınıfnda içeriğini oluşturdum. Bu fonksiyon products endpointinden dönen JSON formaatındaki veriyi projede kullanabileceğim anlamlı bir yapıya dönüştürüyor. Bu anlamlı yapıyı ise ResponseModel adıyla oluşturduğum
model sınıf kapsıyor. ResponseModel sınıf JSON datasındaki key değerlerine ve bu keylerin karşılıklarına erişebilmemi sağlıyor.

Ana sayfada tüm ürünleri GridView widgeT ile listeliyorum. Her bir ürünüde özel olarak oluşturduğum ProductItem widgeT ile gösteriyorum. ProductItem widgetına tıklandığında tıklanan ürün nesnesini state managementa kaydederek ProductDetail sayfasına yönlendirmesini sağladım. ProductDetail sayfasında ise state managementa kaydedilen yani tıklanan ürünün detay bilgilerini güzel bir UI ile listeledim.

Ürün detay sayfasında ise ürünü sepete eklemeye yarayan bir buton da yer almakta. Bu butona Tklandıkça ilgili ürün bir veya birden fazla kez sepete eklenebilmekte. Sepet sayfasında ise sepete eklenen her bir ürün için sepete özel bir ürün widgeT bulunmakta bu ürün widgetında o ürünün sepete kaç kere eklendiğini gösteren bir text ve bu sayıyı azalyıp artırmaya yarayan butonlar bulunmakta. Ayrıca sepetin toplam tutarını gösteren bir widgetda sepet sayfasında yer almaktadır.

EN

I developed this project for the Erciyes University Computer Engineering Mobile Application Development course, 2024 Spring season Term Project. The working principle of the project is as follows: The ProductService class inherits from the ProductInterface class. I implemented the content of the getAll() function, which is defined in the ProductInterface class, in the ProductService class. This function converts the JSON format data returned from the products endpoint into a meaningful structure that I can use in the project. This meaningful structure is encapsulated by the ResponseModel class that I created. The ResponseModel class allows me to access the key values in the JSON data and their corresponding values.

On the home page, I list all the products using the GridView widget. I display each product using a custom ProductItem widget. When the ProductItem widget is clicked, it saves the clicked product object to the state management and navigates to the ProductDetail page. On the ProductDetail page, I listed the detailed information of the clicked product, which is saved in the state management, with a nice UI.

On the product detail page, there is also a button to add the product to the cart. When this button is clicked, the relevant product can be added to the cart one or more times. On the cart page, there is a special product widget for each product added to the cart, which shows a text indicating how many times that product has been added to the cart and buttons to increase or decrease this number. Additionally, there is a widget on the cart page that shows the total amount of the cart.
## Ekran Görüntüleri 
![mainpage](https://github.com/haticekrts/products_app/assets/86536028/4e0b6fc3-8f09-4c5b-9a07-bfad8b5099d5)
![detailpage](https://github.com/haticekrts/products_app/assets/86536028/5638a6cd-dbcc-40e2-87bb-0bd7fdd6c4a7)
![cartpage](https://github.com/haticekrts/products_app/assets/86536028/d8c219aa-3588-43dc-947c-3c0660b49574)
