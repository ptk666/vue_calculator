<template>
  <main class="main-calculator w-screen h-screen text-slate-50 bg-gray-800 flex justify-center items-center">
    <div class="calculator w-60 h-auto border border-slate-500 rounded-xl">
      <div class="calculator-number p-1 bg-zinc-700 rounded-t-xl text-5xl font-thin h-20 flex justify-end items-end">
        <input readonly :value="num_to_screen" class="truncate text-end px-2 bg-zinc-700" />
      </div>
      <div class="calculator-controls text-xl grid grid-cols-4 divide-x divide-zinc-700 border-b border-zinc-700">
          <input type="button" @click="clear_num" class="p-3 flex justify-center items-center bg-zinc-600 active:bg-zinc-500" :value="clear_screen()">
          <input type="button" @click="toggle" class="p-3 flex justify-center items-center bg-zinc-600 active:bg-zinc-500" value="+/-">
          <input type="button" @click="add_num('%')" class="p-3 flex justify-center items-center bg-zinc-600 active:bg-zinc-500" value="%">
          <input type="button" @click="add_num('/')" class="p-3 flex justify-center items-center bg-amber-500 active:bg-amber-600" value="/">
      </div>
      <div class="calculator-controls text-xl grid grid-cols-4 divide-x divide-zinc-700 border-b border-zinc-700">
          <input type="button" @click="add_num(7)" class="p-3 flex justify-center items-center bg-zinc-500 active:bg-zinc-400" value="7" />
          <input type="button" @click="add_num(8)" class="p-3 flex justify-center items-center bg-zinc-500 active:bg-zinc-400" value="8">
          <input type="button" @click="add_num(9)" class="p-3 flex justify-center items-center bg-zinc-500 active:bg-zinc-400" value="9">
          <input type="button" @click="add_num('*')" class="p-3 flex justify-center items-center bg-amber-500 active:bg-amber-600" value="X">
      </div>
      <div class="calculator-controls text-xl grid grid-cols-4 divide-x divide-zinc-700 border-b border-zinc-700">
          <input type="button" @click="add_num(4)" class="p-3 flex justify-center items-center bg-zinc-500 active:bg-zinc-400" value="4">
          <input type="button" @click="add_num(5)" class="p-3 flex justify-center items-center bg-zinc-500 active:bg-zinc-400" value="5">
          <input type="button" @click="add_num(6)" class="p-3 flex justify-center items-center bg-zinc-500 active:bg-zinc-400" value="6">
          <input type="button" @click="add_num('-')" class="p-3 flex justify-center items-center bg-amber-500 active:bg-amber-600" value="-">
      </div>
      <div class="calculator-controls text-xl grid grid-cols-4 divide-x divide-zinc-700 border-b border-zinc-700">
          <input type="button" @click="add_num(1)" class="p-3 flex justify-center items-center bg-zinc-500 active:bg-zinc-400" value="1">
          <input type="button" @click="add_num(2)" class="p-3 flex justify-center items-center bg-zinc-500 active:bg-zinc-400" value="2">
          <input type="button" @click="add_num(3)" class="p-3 flex justify-center items-center bg-zinc-500 active:bg-zinc-400" value="3">
          <input type="button" @click="add_num('+')" class="p-3 flex justify-center items-center bg-amber-500 active:bg-amber-600" value="+">
      </div>
      <div class="calculator-controls text-xl grid grid-cols-4 divide-x divide-zinc-700">
          <input type="button" @click="add_num(0)" class="p-3 flex justify-center items-center bg-zinc-500 active:bg-zinc-400 col-span-2 rounded-bl-xl" value="0">
          <input type="button" @click="add_num('.')" class="p-3 flex justify-center items-center bg-zinc-500 active:bg-zinc-400" value=".">
          <input type="button" @click="result" class="p-3 flex justify-center items-center bg-amber-500 active:bg-amber-600 rounded-br-xl" value="=">
      </div>

    </div>
  </main>
</template>

<script setup>
import { ref, computed } from 'vue';

  // data

  let num = ref('0');
  const clear = ref('AC');

  // computed

  const num_to_screen = computed(() => {
    return num.value == 0 ? 0 : num.value;
  })

  // methods

  const add_num = (n) => {
    if(num.value == 0) {
      num.value = `${n}`
    } else {
      num.value += `${n}`
    }
  }

  const clear_screen = () => {
    return num.value != null ? clear.value = 'C' : clear.value = 'AC';
  }

  const clear_num = () => {
    clear_to_default();
  }

  const result = () => {
    try {
      const item = eval(num.value);

      num.value = item;
    } catch(e) {
      alert('NaN!');
      num.value = 0;
    }
  }

  const toggle = () => {
    let item;
    item = num.value * -1;


    num.value = item;
  }


  // return all to default value
  const clear_to_default = () => {
    num.value = '0';
  }
</script>

<style scoped>

</style>