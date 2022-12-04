import { defineStore } from "pinia";
import usersAPI from "@/services/usersAPI";
/*
PS C:\Users\darya> python
Python 3.10.6 (tags/v3.10.6:9c7b4bd, Aug  1 2022, 21:53:49) [MSC v.1932 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license" for more information.
>>> import platform
>>> platform.machine()
'AMD64'
>>> platform.platform(aliased=0, terse=0)
'Windows-10-10.0.19044-SP0'
>>> import subprocess
    hwid = str(subprocess.check_output('wmic csproduct get uuid'),'utf-8').split('\n')[1].strip()
>>> hwid = str(subprocess.check_output('wmic csproduct get uuid'),'utf-8').split('\n')[1].strip()
*/
export const useUser = defineStore("user", {
  state: () => {
    return {
      user: null,
      register: null,
    };
  },
  getters: {
    useCashRegister(state) {
      return state.register.find(
        (counter) => counter.number === process.env.MACHINE_ID
        // (counter) => counter.number === "AF139EB9-A13E-31D6-213D-04D4C401AA89"
      );
    },
  },
  actions: {
    async loadUserData() {
      if (!this.user) {
        try {
          const userResponse = await usersAPI.getLoggedInUser();
          this.user = userResponse.data;
        } catch (error) {
          console.log(error);
        }
      }

      return this.user;
    },
    async loadCashRegisterData() {
      try {
        const registerResponse = await usersAPI.getCashRegister();
        this.register = registerResponse.data;
      } catch (error) {
        console.log(error);
      }
    },
  },
});
