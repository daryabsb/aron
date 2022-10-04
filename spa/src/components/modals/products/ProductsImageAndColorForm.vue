<template>
  <div class="py-3">
    <form>
      <div class="flex flex-col">
        <div class="w-96">
          <select-input label="Color" :items="colors" required>
            <template #select>
              <select
                v-model="value"
                class="bg-inherit relative text-aronium-white w-full py-1 mb-1 text-sm"
                :style="{ backgroundColor: value }"
                name="itemsSelect"
              >
                <option
                  :value="0"
                  class="bg-aronium-800 text-aronium-white w-full"
                  >(none)</option
                >

                <option
                  v-for="item in Object.entries(colors)"
                  :key="item[0]"
                  class="text-aronium-white w-full"
                  :style="{ backgroundColor: item[1] }"
                  :value="item[1]"
                >
                  {{ item[0] }}
                </option>
              </select>
            </template>
          </select-input>
          <div class="flex flex-nowrap justify-start items-center mx-2 my-6">
            <button
              class="w-30 text-center border border-aronium-600 font-light mr-2 flex bg-inherit text-white focus:outline-none hover:bg-aronium-sky hover:border-aronium-sky px-6 py-1"
              @click.prevent="toggleShow"
            >
              <span class="mr-3">
                <i class="fa fa-check"></i>
              </span>
              Browse
            </button>
            <button
              class="w-30 text-center border border-aronium-600 font-light flex bg-inherit text-white focus:outline-none hover:bg-aronium-sky hover:border-aronium-sky px-6 py-1"
              @click.prevent="clearForm()"
            >
              <span class="pr-3">
                <i class="fa fa-xmark"></i>
              </span>
              Clear
            </button>
          </div>
          <a class="btn" @click="toggleShow">set avatar</a>
          <my-upload
            v-model="show"
            field="img"
            :width="300"
            :height="300"
            url="/upload/product"
            :params="params"
            img-format="jpg"
            @crop-success="cropSuccess"
            @crop-upload-success="cropUploadSuccess"
            @crop-upload-fail="cropUploadFail"
          ></my-upload>
          <!-- :headers="headers" -->
          <div class="w-full h-full flex justify-center items center">
            <div class="w-1/2 h-1/2">
              <img :src="img" alt="product-image" />
            </div>
          </div>
        </div>
      </div>
      <!-- END SECTION 1 CREATE PRODUCT -->
    </form>
  </div>
</template>

<script>
import { ref } from "vue";
import myUpload from "vue-image-crop-upload";

import { colors } from "@/composables/staticData";

import SelectInput from "@/components/shared/forms/SelectInput.vue";

export default {
  components: {
    SelectInput,
    "my-upload": myUpload,
  },
  setup() {
    const value = ref("");
    const img = ref("");

    const uploadImage = (image) => {
      image =
        "http://127.0.0.1:8000/media/uploads/product/e567e528-db62-4c4a-9ca4-9a3d0bec3cc8.jpg";
      img.value = image;
    };

    // IMAGE UPLOAD FUNCTIONS
    const show = false;

    const imgDataUrl = ""; // // the datebase64 url of created image

    const toggleShow = () => (show.value = !show.value);

    const cropSuccess = (imgDataUrl, field) => {
      console.log("-------- crop success --------");
      this.imgDataUrl = imgDataUrl;
    };
    /**
     * upload success
     *
     * [param] jsonData  server api return data, already json encode
     * [param] field
     */
    const cropUploadSuccess = (jsonData, field) => {
      console.log("-------- upload success --------");
      console.log(jsonData);
      console.log("field: " + field);
    };
    /**
     * upload fail
     *
     * [param] status    server api return error status, like 500
     * [param] field
     */
    const cropUploadFail = (status, field) => {
      console.log("-------- upload fail --------");
      console.log(status);
      console.log("field: " + field);
    };

    return {
      colors,
      value,
      img,
      uploadImage,

      // IMAGE UPLOAD
      imgDataUrl,
      toggleShow,
      cropSuccess,
      cropUploadSuccess,
      cropUploadFail,
    };
  },
};
</script>
