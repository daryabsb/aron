<template>
  <div>
    <h3 class="text-lg font-medium leading-6 text-aronium-white">
      Applicant Information
    </h3>
    <p class="mt-1 max-w-2xl text-sm">
      Personal details and application.
    </p>
  </div>
  <div class="mt-5 border-t border-aronium-500">
    <dl class="divide-y divide-aronium-500">
      <div class="py-4 sm:grid sm:grid-cols-3 sm:gap-4 sm:py-5">
        <dt class="text-sm font-medium">Full name</dt>
        <dd class="mt-1 flex text-sm sm:col-span-2 sm:mt-0">
          <span class="flex-grow">Margot Foster</span>
          <span class="ml-4 flex-shrink-0">
            <button
              type="button"
              class="rounded-md font-medium hover:text-pink-500 focus:outline-none focus:ring-2 focus:ring-pink-500 focus:ring-offset-2"
            >
              Update
            </button>
          </span>
        </dd>
      </div>
      <div
        class="py-4 sm:grid sm:grid-cols-3 sm:gap-4 sm:py-5 text-aronium-white"
      >
        <dt class="text-sm font-medium">Application for</dt>
        <dd class="mt-1 flex text-sm sm:col-span-2 sm:mt-0">
          <span class="flex-grow">Backend Developer</span>
          <span class="ml-4 flex-shrink-0">
            <button
              type="button"
              class="rounded-md font-medium hover:text-pink-500 focus:outline-none focus:ring-2 focus:ring-pink-500 focus:ring-offset-2"
            >
              Update
            </button>
          </span>
        </dd>
      </div>
      <div
        class="py-4 sm:grid sm:grid-cols-3 sm:gap-4 sm:py-5 text-aronium-white"
      >
        <dt class="text-sm font-medium">Email address</dt>
        <dd class="mt-1 flex text-sm sm:col-span-2 sm:mt-0">
          <span class="flex-grow">margotfoster@example.com</span>
          <span class="ml-4 flex-shrink-0">
            <button
              type="button"
              class="rounded-md font-medium hover:text-pink-500 focus:outline-none focus:ring-2 focus:ring-pink-500 focus:ring-offset-2"
            >
              Update
            </button>
          </span>
        </dd>
      </div>
      <div
        class="py-4 sm:grid sm:grid-cols-3 sm:gap-4 sm:py-5 text-aronium-white"
      >
        <dt class="text-sm font-medium">Salary expectation</dt>
        <dd class="mt-1 flex text-sm sm:col-span-2 sm:mt-0">
          <span class="flex-grow">$120,000</span>
          <span class="ml-4 flex-shrink-0">
            <button
              type="button"
              class="rounded-md font-medium hover:text-pink-500 focus:outline-none focus:ring-2 focus:ring-pink-500 focus:ring-offset-2"
            >
              Update
            </button>
          </span>
        </dd>
      </div>
      <div
        class="py-4 sm:grid sm:grid-cols-3 sm:gap-4 sm:py-5 text-aronium-white"
      >
        <dt class="text-sm font-medium">About</dt>
        <dd class="mt-1 flex text-sm sm:col-span-2 sm:mt-0">
          <span class="flex-grow"
            >Fugiat ipsum ipsum deserunt culpa aute sint do nostrud anim
            incididunt cillum culpa consequat. Excepteur qui ipsum aliquip
            consequat sint. Sit id mollit nulla mollit nostrud in ea officia
            proident. Irure nostrud pariatur mollit ad adipisicing reprehenderit
            deserunt qui eu.</span
          >
          <span class="ml-4 flex-shrink-0">
            <button
              type="button"
              class="rounded-md font-medium hover:text-pink-500 focus:outline-none focus:ring-2 focus:ring-pink-500 focus:ring-offset-2"
            >
              Update
            </button>
          </span>
        </dd>
      </div>
      <div
        class="py-4 sm:grid sm:grid-cols-3 sm:gap-4 sm:py-5 text-aronium-white"
      >
        <dt class="text-sm font-medium">Attachments</dt>
        <dd class="mt-1 text-sm sm:col-span-2 sm:mt-0">
          <ul
            role="list"
            class="divide-y divide-aronium-500 rounded-sm border border-aronium-500"
          >
            <li
              class="flex items-center justify-between py-3 pl-3 pr-4 text-sm"
            >
              <div class="flex w-0 flex-1 items-center">
                <PaperClipIcon
                  class="h-5 w-5 flex-shrink-0 text-gray-400"
                  aria-hidden="true"
                />
                <span class="ml-2 w-0 flex-1 truncate"
                  >resume_back_end_developer.pdf</span
                >
              </div>
              <div class="ml-4 flex flex-shrink-0 space-x-4">
                <button
                  type="button"
                  class="font-medium hover:text-pink-500 focus:outline-none focus:ring-2 focus:ring-pink-500 focus:ring-offset-2"
                >
                  <PlusIcon
                    class="h-5 w-5 flex-shrink-0"
                    aria-hidden="true"
                  ></PlusIcon>
                </button>
                <span class="text-gray-300" aria-hidden="true">|</span>
                <button
                  type="button"
                  class="font-medium hover:text-pink-500 focus:outline-none focus:ring-2 focus:ring-pink-500 focus:ring-offset-2"
                >
                  <MinusIcon
                    class="h-5 w-5 flex-shrink-0"
                    aria-hidden="true"
                  ></MinusIcon>
                </button>
              </div>
            </li>
            <li
              class="flex items-center justify-between py-3 pl-3 pr-4 text-sm"
            >
              <div class="flex w-0 flex-1 items-center">
                <PaperClipIcon
                  class="h-5 w-5 flex-shrink-0 text-gray-400"
                  aria-hidden="true"
                />
                <span class="ml-2 w-0 flex-1 truncate"
                  >coverletter_back_end_developer.pdf</span
                >
              </div>
              <div class="ml-4 flex flex-shrink-0 space-x-4">
                <button
                  type="button"
                  class="font-medium hover:text-pink-500 focus:outline-none focus:ring-2 focus:ring-pink-500 focus:ring-offset-2"
                >
                  Update
                </button>
                <span class="text-gray-300" aria-hidden="true">|</span>
                <button
                  type="button"
                  class="font-medium hover:text-pink-500 focus:outline-none focus:ring-2 focus:ring-pink-500 focus:ring-offset-2"
                >
                  Remove
                </button>
              </div>
            </li>
          </ul>
        </dd>
      </div>
    </dl>
  </div>
</template>

<script setup>
import { PaperClipIcon, PlusIcon, MinusIcon } from "@heroicons/vue/20/solid";
</script>
