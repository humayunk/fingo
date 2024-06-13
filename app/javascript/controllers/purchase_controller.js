import { Controller } from "@hotwired/stimulus"

import Swal from "sweetalert2"

// Connects to data-controller="purchase"
export default class extends Controller {
  static targets = [ "name", "price", "form", "button"]
  static outlets = [ "user-coins" ]

  connect() {
    // console.log("connected!");
  }

  callOutlet() {
    this.userCoinsOutlet.test("I am calling the outlet from purchase controller");
  }

  // pass sweet alert here to customize
  purchase(event) {
    event.preventDefault()
    Swal.fire({
      title: `Are you sure you want to purchase this item?\n${this.nameTarget.innerText} for ${this.priceTarget.innerText} `,
      icon: 'question',
      confirmButtonText: 'DO IT!!!!',
      showCancelButton: true,
      cancelButtonText: "Nopeeee",
      showLoaderOnConfirm: true,
      preConfirm: async () => {
        const options={
          method: "post",
          headers: {
            "Accept": 'application/json'
          },
          body: new FormData(this.formTarget)
        };

        return fetch(this.formTarget.action, options)
          .then(response => response.json())
          .then((data) => {
            return data
          })
      }})
      .then((result) => {
        if (result.isConfirmed) {
          const data = result.value;
          if (data.status === 'success') {
          // do the Ajax request to confirm the transaction. I.e. do you have enough coins
            Swal.fire({
              title: "Congrats Fam!",
              text: `You have purchased ${this.nameTarget.innerText}`,
              icon: "success"
            })
            if (data.new_coins_balance) { this.userCoinsOutlet.updateCoinBalance(data.new_coins_balance); }
            if (data.new_coins_balance) { this.userCoinsOutlet.updateCoinBalance(data.new_coins_balance); }
          } else if (result.value.status === 'failure') {
            Swal.fire({
              title: "Oops!",
              text: "Not enough coins 😿",
              icon: "error"
            })
          }
        }
      })
  }
}




    // const myPromise = new Promise ((resolve, _) => {
    //   setTimeout(() => {
    //     resolve("success");
    //   }, 1000);
    // });
    // return myPromise
    //   .then((data) => {
    //     if (data === "success") {
    //       return "success";
    //     }
    //   })


     // You can pass HTML to the sweetalert to further customize like below
//       html: `<div class="modal-content">
//     <span class="close">&times;</span>
//     <p>Some text in the Modal..</p>
//   </div>
// `,
