<template>
  <div>
    <Popper>
      <a
        ref="btnDropdownRef"
        class="hover:text-slate-500 text-slate-700 px-3 py-2 flex items-center text-xs uppercase font-bold"
        href="#pablo"
      >
        Demo Pages
      </a>
      <template #content="{ close }">
        <div
          ref="popoverDropdownRef"
          class="bg-white text-base z-50 float-left py-2 list-none text-left rounded shadow-lg min-w-48"
        >
          <span
            class="text-sm pt-2 pb-0 px-4 font-bold block w-full whitespace-nowrap bg-transparent text-slate-400"
          >
            Admin Layout
          </span>
          <router-link
            to="/dash/dashboard"
            class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-slate-700"
          >
            Dashboard
          </router-link>
          <router-link
            to="/dash/settings"
            class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-slate-700"
          >
            Settings
          </router-link>
          <router-link
            to="/dash/tables"
            class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-slate-700"
          >
            Tables
          </router-link>
          <router-link
            to="/dash/maps"
            class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-slate-700"
          >
            Maps
          </router-link>
          <div class="h-0 mx-4 my-2 border border-solid border-slate-100" />
          <span
            class="text-sm pt-2 pb-0 px-4 font-bold block w-full whitespace-nowrap bg-transparent text-slate-400"
          >
            Auth Layout
          </span>
          <router-link
            to="/auth/login"
            class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-slate-700"
          >
            Login
          </router-link>
          <router-link
            to="/auth/register"
            class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-slate-700"
          >
            Register
          </router-link>
          <div class="h-0 mx-4 my-2 border border-solid border-slate-100" />
          <span
            class="text-sm pt-2 pb-0 px-4 font-bold block w-full whitespace-nowrap bg-transparent text-slate-400"
          >
            No Layout
          </span>
          <router-link
            to="/landing"
            class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-slate-700"
          >
            Landing
          </router-link>
          <router-link
            to="/profile"
            class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-slate-700"
          >
            Profile
          </router-link>
          <a
            href="javascript:void(0);"
            class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-slate-700"
            @click="close"
          >
            Close
          </a>
        </div>
      </template>
    </Popper>
  </div>
</template>
<script>
export default {
  name: "IndexDropDown",
};
</script>
