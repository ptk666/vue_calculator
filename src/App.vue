<template>
    <CalculatorComponent />
    <FooterComponent />
</template>

<script>
import CalculatorComponent from './components/CalculatorComponent.vue'
import FooterComponent from './components/FooterComponent.vue'

export default {
  name: 'App',
  components: {
    CalculatorComponent,
    FooterComponent
  }
}
</script>

<style>
</style>
