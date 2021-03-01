function selling (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const taxVal = itemPrice.value * 0.1;
    const addTaxPrice  = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = Math.floor(`${taxVal}`);
    const feeVal = itemPrice.value - taxVal;
    const profit  = document.getElementById("profit");
    profit.innerHTML = Math.ceil(`${feeVal}`);
  });
}

window.addEventListener('load', selling);