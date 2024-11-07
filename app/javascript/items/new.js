function calculator() {
  const priceForm = document.getElementById("item-price");
  priceForm.addEventListener('input', function(){
    const inputPrice = document.getElementById("item-price").value;
    const salesCommission = Math.floor(inputPrice * 0.1);
    const salesProfit = Math.floor(inputPrice - salesCommission);
    const charCommission = document.getElementById("add-tax-price");
    charCommission.innerHTML = `${salesCommission}`;
    const charProfit = document.getElementById("profit")
    charProfit.innerHTML = `${salesProfit}`;
  });
}

window.addEventListener('turbo:load', calculator);
window.addEventListener('turbo:render', calculator);