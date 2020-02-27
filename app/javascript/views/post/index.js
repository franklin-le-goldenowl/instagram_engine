import * as $ from 'jquery'
import Vue from 'vue/dist/vue.esm'

if (window.location.pathname == '/') {
  $(document).ready(() => {
    const app = new Vue({
      el: '#post-index',
      data: {
        items: [
          { message: 'Foo' },
          { message: 'Bar' }
        ]
      },
      mounted: function() {
        console.log(1)
      }
    })
  })
}
