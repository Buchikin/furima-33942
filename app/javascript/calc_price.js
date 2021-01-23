function calc_price (){
  const price = document.getElementById("item-price");
  price.addEventListener("keyup", () => {
    const taxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    if (Number.isInteger(Number(price.value))){
      const tax = Math.floor(price.value * 0.1);
      const gain = Number(price.value) - tax;
      taxPrice.innerHTML = `${tax}`;
      profit.innerHTML = `${gain}`;
    } else {
      taxPrice.innerHTML = "半角整数で入力";
      profit.innerHTML = "半角整数で入力";
    }
  });
}

window.addEventListener('load', calc_price);