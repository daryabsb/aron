<template>
  <div class="my-2 text-aronium-white">
    <div class="flex flex-wrap items-center md:justify-between justify-center">
      <div class="w-full md:w-4/12 px-4">
        <div class="text-sm font-semibold py-1 text-center md:text-left">
          Copyright © {{ date }}
          <a
            href="https://www.creative-tim.com?ref=vn-footer-admin"
            class="hover:text-aronium-600 text-sm font-semibold py-1"
          >
            Darya Ibrahim
          </a>
        </div>
      </div>
      <div class="w-full md:w-8/12 px-4">
        <ul class="flex flex-wrap list-none md:justify-end justify-center">
          <li>
            <a
              href="https://www.creative-tim.com?ref=vn-footer-admin"
              class="hover:text-aronium-600 text-sm font-semibold block py-1 px-3"
            >
              Darya Ibrahim
            </a>
          </li>
          <li>
            <a
              href="https://www.creative-tim.com/presentation?ref=vn-footer-admin"
              class="hover:text-aronium-600 text-sm font-semibold block py-1 px-3"
            >
              About Us
            </a>
          </li>
          <li>
            <a
              href="http://blog.creative-tim.com?ref=vn-footer-admin"
              class="hover:text-aronium-600 text-sm font-semibold block py-1 px-3"
            >
              Blog
            </a>
          </li>
          <li>
            <a
              href="https://github.com/creativetimofficial/vue-notus/blob/main/LICENSE.md?ref=vn-footer-admin"
              class="hover:text-aronium-600 text-sm font-semibold block py-1 px-3"
            >
              MIT License
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      date: new Date().getFullYear(),
    };
  },
};
</script>
